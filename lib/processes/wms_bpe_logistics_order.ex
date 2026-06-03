defmodule WMS.BPE.LogisticsOrder do
  require BPE
  require Logger

  def def() do
    BPE.process(
      name: "WMS Logistics Order",
      tasks: [
        BPE.task(name: :Init),
        BPE.task(name: :Approval),
        BPE.task(name: :Transit),
        BPE.task(name: :Delivered)
      ],
      events: [
        BPE.beginEvent(name: :Start),
        BPE.endEvent(name: :End)
      ],
      flows: [
        BPE.sequenceFlow(source: :Start, target: :Init),
        BPE.sequenceFlow(source: :Init, target: :Approval),
        BPE.sequenceFlow(source: :Approval, target: :Transit),
        BPE.sequenceFlow(source: :Transit, target: :Delivered),
        BPE.sequenceFlow(source: :Delivered, target: :End)
      ],
      beginEvent: :Start,
      endEvent: :End
    )
  end

  def action({:request, :Init}, proc) do
    Logger.info("LogisticsOrder: Init phase started.")
    {:reply, proc}
  end

  def action({:request, :Approval}, proc) do
    Logger.info("LogisticsOrder: Approval phase started.")
    {:reply, proc}
  end

  def action({:request, :Transit}, proc) do
    Logger.info("LogisticsOrder: Transit phase started.")
    {:reply, proc}
  end

  def action({:request, :Delivered}, proc) do
    Logger.info("LogisticsOrder: Delivered phase reached.")
    {:reply, proc}
  end
end
