defmodule BPE.Create do
  require BPE
  require FORM

  def doc(), do: "Форма створення BPE/BPMN процесів."

  def id(), do: BPE.process()

  def new(name, _, _) do
    procs = Application.get_env(:bpe, :procmodules, []) |> Enum.reject(&(&1 == :bpe))
    default_proc = List.first(procs) || :bpe_account
    
    :erlang.put(:process_type_pi_none, to_string(default_proc))

    options = Enum.map(procs, fn p ->
      title_str = 
        case p do
          :bpe_account -> "Рахунок"
          atom -> atom |> to_string() |> String.replace("Elixir.", "")
        end
        
      FORM.opt(
        name: p,
        checked: p == default_proc,
        title: title_str
      )
    end)

    FORM.document(
      name: :form.atom([:pi, name]),
      sections: [FORM.sec(name: ["Новий процес: "])],
      buttons: [
        FORM.but(
          id: :form.atom([:pi, :decline]),
          title: "Відміна",
          class: :cancel,
          postback: {:Discard, []}
        ),
        FORM.but(
          id: :form.atom([:pi, :proceed]),
          title: "Створення",
          class: [:button, :sgreen],
          sources: [:process_type_process_none],
          postback: {:Spawn, []}
        )
      ],
      fields: [
        FORM.field(
          name: :process_type,
          id: :process_type,
          type: :select,
          title: "Тип:",
          tooltips: [],
          default: default_proc,
          postback: {:TypeProcess, :form.atom([:pi, name])},
          options: options
        )
      ]
    )
  end
end
