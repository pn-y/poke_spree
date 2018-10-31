module ProductImportStateMachine
  extend ActiveSupport::Concern

  included do
    state_machine :state, initial: :new do
      state :new
      state :started
      state :finished

      event :start do
        transition new: :started
      end

      event :finish do
        transition started: :finished
      end
    end
  end
end

