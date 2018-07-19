defmodule CopanWeb.Schema.Appointment do
  use Absinthe.Schema.Notation

  object :appointment_report do
    field :total, non_null(:integer)
    field :created, non_null(:integer)
    field :no_show, non_null(:integer)
    field :confirmed, non_null(:integer)
  end

  object :points do
    field :date, non_null(:datetime)
    field :value, non_null(:integer)
  end

  enum :grouping_values, values: [:year, :month, :day, :hour, :minute]

  object :appointment_queries do
    field :appointment_report, list_of(non_null(:appointment_report)) do
      arg :filter, non_null(:filter)

      resolve &Copan.Resolvers.Appointment.report/3
    end

    field :appointment_graph, list_of(non_null(:points)) do
      arg :filter, non_null(:filter)
      arg :group_by, non_null(:grouping_values)

      resolve &Copan.Resolvers.Appointment.graph/3
    end
  end
end
