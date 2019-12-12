class CatRental < ApplicationRecord
    STATUSES = %w(PENDING APPROVED DENIED)

    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: STATUSES

    belongs_to :cat,
      class_name: :Cat,
      primary_key: :id,
      foreign_key: :cat_id  

    def overlapping_requests
        CatRental.joins(:cat)
          .where.not(id: self.id)
          .where(cat_id: self.cat_id)
          .where.not('start_date > :end_date OR end_date < :start_date', start_date: self.start_date, end_date: self.end_date)  
    end

    def overlapping_approved_requests
        overlapping_requests.where('status = \'APPROVED\'')
    end

    def does_not_overlap_approved_request
        overlapping_approved_requests.exists?
    end

    def approved?
        self.status == "APPROVED"
    end 

    def pending?
        self.status == "PENDING"
    end 

    def overlapping_pending_requests
        overlapping_requests.where('status = \'PENDING\'')
    end

    def approve!
        self.status = 'APPROVED'
        self.save 
        overlapping_pending_requests.each do | req |
            req.status = 'DENIED'
            req.save
        end
    end

    def deny!
        self.status = 'DENIED'
        self.save
    end
end