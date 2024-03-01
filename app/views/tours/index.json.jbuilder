if @tours.present?
  json.tours render(partial: 'shared/my_tours_card', collection: @tours, as: :tour, formats: :html)
else
  json.tours ""
end
