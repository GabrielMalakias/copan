wrk.method = "POST"
wrk.body =
  [[{appointmentGraph(filter: {startsAt: "2018-06-01T22:00:00.000Z",
    endsAt: "2018-07-20T22:00:00.000Z"}, groupBy: DAY) {
    date
    value}}]]
wrk.headers["Authorization"] = "Bearer 00000000-0000-4000-8000-000000000000"
