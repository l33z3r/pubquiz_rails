class Api::V1::QuizEventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :time_zone, :starts_at, :logo_url,
             :open_to_the_public, :in_dst, :venue_id,
             :quiz_rounds, :quiz_round_questions

  def starts_at
    object.starts_at.to_i
  end

  def logo_url
    # logo of the sponsor
    object.logo.try(:url)
  end

  def quiz_rounds # todo
    [{id: 123, sorting_order: 10, name: 'Lorem ipsum',
      quiz_round_question_ids: [1, 2, 3]},
     {id: 456, sorting_order: 20, name: 'Lorem ipsum',
      quiz_round_question_ids: [4, 5, 6]},
     {id: 789, sorting_order: 30, name: 'Lorem ipsum',
      quiz_round_question_ids: [7, 8, 9]}
    ]
  end

  def quiz_round_questions # todo
    [{id: 1,
     question_id: 123456,
     quiz_round_id: 123,
     sorting_order: 10,
     visible_text: "Who was Alonso's team mate at Ferrari in 2013?",
     question_answers: [
             {visible_text: 'Filipe Masse', id: 123},
             {visible_text: 'Foghorn Leghorn', id: 124},
             {visible_text: 'Chilton Pike', id: 125},
             {visible_text: 'Michael Schumaker', id: 126},
     ],
     time_limit_seconds: 10,
     points_available: 20
    },
    {id: 2,
     question_id: 123456,
     quiz_round_id: 123,
     sorting_order: 10,
     visible_text: "Who was Alonso's team mate at Ferrari in 2013?",
     question_answers: [
             {visible_text: 'Filipe Masse', id: 123},
             {visible_text: 'Foghorn Leghorn', id: 124},
             {visible_text: 'Chilton Pike', id: 125},
             {visible_text: 'Michael Schumaker', id: 126},
     ],
     time_limit_seconds: 10,
     points_available: 20
    },
    {id: 3,
      question_id: 123456,
      quiz_round_id: 123,
      sorting_order: 10,
      visible_text: "Who was Alonso's team mate at Ferrari in 2013?",
      question_answers: [
              {visible_text: 'Filipe Masse', id: 123},
              {visible_text: 'Foghorn Leghorn', id: 124},
              {visible_text: 'Chilton Pike', id: 125},
              {visible_text: 'Michael Schumaker', id: 126},
      ],
      time_limit_seconds: 10,
      points_available: 20
     }]
  end

end
