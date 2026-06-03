defmodule WMS.BPE.ServiceOrder do
  require BPE
  require Logger

  def def() do
    BPE.process(
      name: "ServiceOrder",
      tasks: [
        BPE.task(name: :Init),
        BPE.task(name: :Diagnostic),
        BPE.task(name: :Repair),
        BPE.task(name: :Testing),
        BPE.task(name: :Ready)
      ],
      events: [
        BPE.beginEvent(name: :Start),
        BPE.endEvent(name: :End)
      ],
      flows: [
        BPE.sequenceFlow(source: :Start, target: :Init),
        BPE.sequenceFlow(source: :Init, target: :Diagnostic),
        BPE.sequenceFlow(source: :Diagnostic, target: :Repair, condition: {:service, :needs_repair}),
        BPE.sequenceFlow(source: :Diagnostic, target: :Ready, condition: {:service, :no_repair_needed}),
        BPE.sequenceFlow(source: :Repair, target: :Testing),
        BPE.sequenceFlow(source: :Testing, target: :Ready, condition: {:service, :testing_passed}),
        BPE.sequenceFlow(source: :Testing, target: :Repair, condition: {:service, :testing_failed}),
        BPE.sequenceFlow(source: :Ready, target: :End)
      ],
      beginEvent: :Start,
      endEvent: :End
    )
  end

  def action({:request, :Init}, proc) do
    Logger.info("ServiceOrder: Init phase started.")
    {:reply, proc}
  end

  def action({:request, :Diagnostic}, proc) do
    Logger.info("ServiceOrder: Diagnostic phase started.")
    {:reply, proc}
  end

  def action({:request, :Repair}, proc) do
    Logger.info("ServiceOrder: Repair phase started.")
    {:reply, proc}
  end

  def action({:request, :Testing}, proc) do
    Logger.info("ServiceOrder: Testing phase started.")
    {:reply, proc}
  end

  def action({:request, :Ready}, proc) do
    Logger.info("ServiceOrder: Ready phase reached. Weapon is ready for use.")
    {:reply, proc}
  end

  def action(event, proc) do
    Logger.info("ServiceOrder: Unknown event #{inspect(event)}")
    {:reply, proc}
  end

  # ABAC / Flow Conditions
  def needs_repair(_proc), do: true
  def no_repair_needed(_proc), do: false

  def testing_passed(_proc), do: true
  def testing_failed(_proc), do: false
end
