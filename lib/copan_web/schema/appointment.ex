defmodule CopanWeb.Schema.Appointment do
  use Absinthe.Schema.Notation

  object :appointment_report do
    field :total, non_null(:integer)
    field :created, non_null(:integer)
    field :no_show, non_null(:integer)
  end

  object :appointment_queries do
    field :appointment_report, list_of(non_null(:appointment_report)) do
      arg :filter, non_null(:filter)

      resolve &Copan.Resolvers.Appointment.report/3
    end
  end
end
