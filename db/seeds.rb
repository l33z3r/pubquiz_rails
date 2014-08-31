# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

QuizEvent.where(id: 1).first_or_create(
        name: 'School Fundraiser', 
        description: 'To help raise funds for new computers for our school', 
        time_zone: 'Dublin', 
        starts_at: '2014-08-31 18:09:07', 
        venue_id: 1, 
        created_by: 1, 
        updated_by: nil, 
        event_guid: 'WKZEDcEP', 
        sponsor_logo_url: nil, 
        logo_file_name: nil, 
        logo_content_type: nil, 
        logo_file_size: nil, 
        logo_updated_at: nil)

Venue.where(id: 1).first_or_create(
        public_title: 'Oscars of Smithfield',
        address: 'Smithfield Square, Dublin 7, Ireland', 
        latitude: 53.5, 
        longitude: -6.1, 
        created_by: 1, 
        updated_by: nil, 
        publicly_visible: true, 
        approved_by: 1, 
        time_zone: 'Dublin', 
        logo_file_name: nil, 
        logo_content_type: nil, 
        logo_file_size: nil, 
        logo_updated_at: nil)

