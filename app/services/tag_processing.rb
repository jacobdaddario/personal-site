# This class is not included in lib, since it is not reusable outside of this
# specific domain application

class TagProcessing
  # This TagProcessing class is a mediator between taggings and tags, sorting
  # out user input on a posts form, and then prepping them for the database.
  #
  # Inputs:
  # params - should include a :tags field that is split and manipulated in the
  #          object
  #
  # Outputs:
  # ready_for_tagging - tags that are ready to be added to the proper association
  attr_writer :raw_tags

  def initialize(params)
    @raw_tags = params[:post][:tags].split(',')
  end

  def self.call(params)
    # A public call method that keeps application code clean and allows for
    # syntactically obvious linkage
    TagProcessing.new(params).call
  end

  def call
    # A baseline call method that falls outside of the class method; runs
    # the entire stack
    separate_new_tags
    save_new_tags
    @raw_tags
  end

  private


    def separate_new_tags
      # Separates unsaved tags from those that already exist
      @new_tags = []
      @raw_tags.each do |tag|
        unless Tag.find_by(name: tag)
          @new_tags << tag
          puts tag
        end
      end
    end

    def save_new_tags
      # Saves the new tags to the database via ActiveRecord
      @new_tags.each do |tag|
        current_tag = Tag.new(name: tag)
        unless current_tag.save
          # This is used to incorporate the tag processing object into the post
          # create action
          return false
        end
      end
    end
end