module Post::StateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :status do
      state :fresh, initial: true
      state :fresh, :edited, :published, :unpublished

      event :publish do
        after do
          set_published_at
        end
        transitions from: [:fresh, :unpublished, :edited], to: :published
      end

      event :edit do
        transitions from: [:fresh, :published, :edited, :unpublished], to: :edited
      end

      event :unpublish do
        transitions from: :published, to: :unpublished
      end
    end

    def set_published_at
      touch(:published_at)
    end
  end
end