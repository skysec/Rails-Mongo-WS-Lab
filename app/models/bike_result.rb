class BikeResult < LegResult
  field :mph, type: Float

  def calc_ave
    if event && secs
      miles = event.miles
      self.mph = miles.nil? ? nil : miles * 3600 / secs
    end
  end
end