json.extract! game, :id, :start_at, :place_name, :team_a, :team_b, :member_a, :member_b, :score_a, :score_b, :full_score, :created_at, :updated_at
json.url game_url(game, format: :json)