class Avo::Filters::AppointmentTimeframe < Avo::Filters::BooleanFilter
  self.name = "Timeframe"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, values)
    if values["today"]
      query.where(scheduled_at: Date.today.all_day)
    elsif values["upcoming"]
      query.where(scheduled_at: Date.today.end_of_day...)
    elsif values["past"]
      query.where(scheduled_at: ...Date.today.beginning_of_day)
    else
      query
    end
  end

  def options
    {
      today: "Today",
      upcoming: "Upcoming",
      past: "Past"
    }
  end
end
