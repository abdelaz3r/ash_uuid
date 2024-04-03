defmodule AshUUID.Test.BananaSmoothie do
  @moduledoc false

  use Ash.Resource, domain: AshUUID.Test, data_layer: AshPostgres.DataLayer, extensions: [AshUUID]

  code_interface do
  end

  postgres do
    table "banana_smoothies"
    repo AshUUID.Test.Repo
  end

  attributes do
    uuid_attribute :id, encoded?: false, prefixed?: false

    create_timestamp :inserted_at
  end

  relationships do
    has_many :bananas, AshUUID.Test.Banana
  end

  actions do
    defaults [:read, create: :*, update: :*]
    default_accept :*
  end
end
