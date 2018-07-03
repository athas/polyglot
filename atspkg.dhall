{- Imports -}
    let prelude =
          http://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in  let not = http://hackage.haskell.org/package/dhall/src/Prelude/Bool/not

in  let cross = True

in  let parallel = True

in  let cc = "gcc"

in  let srcFile = if parallel then "polyglot" else "compat"

in  let deps = if parallel then [ "concurrency", "specats" ] else [ "specats" ]

in  let native = if not cross then [ "-mtune=native" ] else [] : List Text

in  let iccFlags = [ "-D__PURE_INTEL_C99_HEADERS__" ]

in    prelude.default
    ⫽ { bin =
          [   prelude.bin
            ⫽ { src =
                  "src/${srcFile}.dats"
              , target =
                  "target/poly"
              , gcBin =
                  True
              , libs =
                  [ "pthread" ]
              }
          ]
      , test =
          [   prelude.bin
            ⫽ { src =
                  "test/test.dats"
              , target =
                  "target/test"
              , gcBin =
                  True
              , libs =
                  [ "pthread" ]
              }
          ]
      , man =
          [ "man/poly.md" ] : Optional Text
      , completions =
          [ "compleat/poly.usage" ] : Optional Text
      , dependencies =
          prelude.mapPlainDeps deps
      , cflags =
          [ "-flto", "-O2", "-static" ] # native # iccFlags
      , ccompiler =
          cc
      , debPkg =
          prelude.mkDeb
          (   prelude.debian "polyglot"
            ⫽ { version =
                  [ 0, 4, 32 ]
              , maintainer =
                  "Vanessa McHale <vamchale@gmail.com>"
              , description =
                  "Determine project contents"
              , manpage =
                  [ "man/poly.1" ] : Optional Text
              , binaries =
                  [ "target/poly" ]
              }
          )
      }
