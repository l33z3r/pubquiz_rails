collection :@events
  attributes :id, :event_guid, :name, :description, :starts_at_epoch
  attributes :time_zone_offset_minutes, :in_dst
  node(:location) { |e| e.venue.public_title }
  node(:address)  { |e| e.venue.address }
  node(:logo_url) { |e| e.logo.url if e.logo.try(:file_name) }
