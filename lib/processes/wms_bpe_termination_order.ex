defmodule WMS.BPE.TerminationOrder do
  require BPE
  require Logger

  def def() do
    BPE.process(
      name: "WMS Termination Order",
      tasks: [
        BPE.task(name: :Init),
        BPE.task(name: :Commission),
        BPE.task(name: :Decommissioned),
        BPE.task(name: :Utilized)
      ],
      events: [
        BPE.beginEvent(name: :Start),
        BPE.endEvent(name: :End)
      ],
      flows: [
        BPE.sequenceFlow(source: :Start, target: :Init),
        BPE.sequenceFlow(source: :Init, target: :Commission),
        BPE.sequenceFlow(source: :Commission, target: :Decommissioned),
        BPE.sequenceFlow(source: :Decommissioned, target: :Utilized),
        BPE.sequenceFlow(source: :Utilized, target: :End)
      ],
      beginEvent: :Start,
      endEvent: :End
    )
  end

  def action({:request, :Init}, proc) do
    Logger.info("TerminationOrder: Init phase started.")
    {:reply, proc}
  end

  def action({:request, :Commission}, proc) do
    Logger.info("TerminationOrder: Commission phase started.")
    {:reply, proc}
  end

  def action({:request, :Decommissioned}, proc) do
    Logger.info("TerminationOrder: Decommissioned phase started.")
    {:reply, proc}
  end

  def action({:request, :Utilized}, proc) do
    Logger.info("TerminationOrder: Utilized phase reached.")
    {:reply, proc}
  end
end
