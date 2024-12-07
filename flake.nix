{
  description = "A very basic flake";

  outputs = { self }: {
    lib = {
      union-fn-output-with-input-attrset = f: input: input // (f input);
      union-fn-output-with-input-attrset-high-precedence = f: input: (f input) // input;

      keepFnInput = f: input: let
        nested-input = { inherit input; };
      in
        union-fn-output-with-input-attrset f nested-input;
      forceKeepFnInput = f: input: let
        nested-input = { inherit input; };
      in
        union-fn-output-with-input-attrset-high-precedence f nested-input;
    };
  };
}
