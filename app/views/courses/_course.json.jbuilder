json.extract! course, :id, :year, :title, :created_at, :updated_at
json.url course_url(course, format: :json)
