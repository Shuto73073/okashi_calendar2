class Record < ApplicationRecord
    belongs_to :user

    alias_attribute :start_time, :date

    AMOUNTS = {
        small: 1,
        medium: 2,
        large: 3
    }.freeze

    def amount_label
      case amount
      when AMOUNTS[:small]
        '食べていないに等しい'
      when AMOUNTS[:medium]
        '普通'
      when AMOUNTS[:large]
        '食べ過ぎ'
      end
    end


    def amount_class
      case amount
      when AMOUNTS[:small]
        'amount-small'
      when AMOUNTS[:medium]
        'amount-medium'
      when AMOUNTS[:large]
        'amount-large'
      end
    end    

    validates :date, presence: true
    validates :snack_name, presence: true
    validates :amount, presence: true, inclusion:{ in: AMOUNTS.values }
end
