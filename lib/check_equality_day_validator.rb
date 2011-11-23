class CheckEqualityDayValidator < ActiveModel::Validator
  def validate(record)
    if record.errors.blank? and !record.start_time.to_date.eql?(record.end_time.to_date)
      record.errors[:end_time] << ": run-time should take only one day"
    end
  end
end
