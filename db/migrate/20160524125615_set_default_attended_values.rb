class SetDefaultAttendedValues < ActiveRecord::Migration
  def up
    WebinarAttendee.all.each { |wa| wa.attened = false if wa.attended = nil }
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't unset values to nil"
  end
end
