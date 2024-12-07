{
  description = "A very basic flake";

  outputs = { self }: {
    lib = {
      keepFnInput = f: input: let
        nested-input = { inherit input; };
      in
        nested-input // (f input);

      forceKeepFnInput = f: input: let
        nested-input = { inherit input; };
      in
        (f input) // nested-input;
    };
  };
}
