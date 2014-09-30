class Api::QuizMaster::TeamSerializer < ActiveModel::Serializer

  # abandoned, because I couldn't send in a second object.  Then, it just became easier to
  # build a json manually inside the controller.

  attributes :id, :name, :score

end