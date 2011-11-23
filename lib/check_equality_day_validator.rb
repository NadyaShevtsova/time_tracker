class CheckEqualityDayValidator < ActiveModel::Validator
  def validate(record)
    if record.errors.blank?
      record.errors[:end_time] <<": run-time should take only one day" unless (record.start_time.to_date != record.end_time.to_date)
    end
  end
end
