defmodule WMS.BPE.IncomeOrder do
  require BPE
  require Logger

  def def() do
    BPE.process(
      name: "WMS Income Order",
      tasks: [
        BPE.task(name: :Init),
        BPE.task(name: :Inspection),
        BPE.task(name: :Registration),
        BPE.task(name: :Stored)
      ],
      events: [
        BPE.beginEvent(name: :Start),
        BPE.endEvent(name: :End)
      ],
      flows: [
        BPE.sequenceFlow(source: :Start, target: :Init),
        BPE.sequenceFlow(source: :Init, target: :Inspection),
        BPE.sequenceFlow(source: :Inspection, target: :Registration),
        BPE.sequenceFlow(source: :Registration, target: :Stored),
        BPE.sequenceFlow(source: :Stored, target: :End)
      ],
      beginEvent: :Start,
      endEvent: :End
    )
  end

  def action({:request, :Init}, proc) do
    Logger.info("IncomeOrder: Init phase started.")
    {:reply, proc}
  end

  def action({:request, :Inspection}, proc) do
    Logger.info("IncomeOrder: Inspection phase started.")
    {:reply, proc}
  end

  def action({:request, :Registration}, proc) do
    Logger.info("IncomeOrder: Registration phase started.")
    {:reply, proc}
  end

  def action({:request, :Stored}, proc) do
    Logger.info("IncomeOrder: Stored phase reached.")
    {:reply, proc}
  end
end
