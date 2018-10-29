    let deps =
          [ "base == 4.*"
          , "megaparsec >= 7.0.1"
          , "dhall >= 1.18.0"
          , "dhall-json >= 1.2.4"
          , "hpack >= 0.31.0"
          , "transformers"
          , "aeson"
          , "text"
          , "microlens"
          , "filepath"
          , "aeson-pretty"
          , "bytestring"
          , "prettyprinter"
          , "yaml"
          ]

in  let exe-deps = deps # [ "optparse-applicative" ]

in  { name =
        "hpack-dhall"
    , version =
        "0.4.0"
    , maintainer =
        "Phil de Joux <phil.dejoux@blockscope.com>"
    , copyright =
        "\u00A9 2018 Phil de Joux"
    , license =
        "BSD3"
    , license-file =
        "LICENSE"
    , category =
        "Development"
    , synopsis =
        "Hpack's dhalling"
    , description =
        "This package allows you to use the Dhall configuration language to specify Haskell packages."
    , github =
        "blockscope/hpack-dhall"
    , tested-with =
        "GHC == 8.4.3, GHC == 8.4.4, GHC == 8.6.1"
    , extra-source-files =
        [ "package.dhall"
        , "changelog.md"
        , "README.md"
        , "test/golden/**/*.dhall"
        , "test/golden/**/*.dhl"
        , "test/golden/**/*.cabal"
        , "test/golden/**/*.json"
        , "test/golden/**/*.yaml"
        , "test/golden/**/*.golden"
        ]
    , ghc-options =
        "-Wall"
    , dependencies =
        deps
    , source-dirs =
        "library"
    , executables =
        { dhall-hpack-cabal =
            { main =
                "CabalMain.hs"
            , source-dirs =
                "exe/dhall-hpack-cabal"
            , dependencies =
                exe-deps
            }
        , dhall-hpack-json =
            { main =
                "JsonMain.hs"
            , source-dirs =
                [ "exe/options", "exe/dhall-hpack-json" ]
            , dependencies =
                exe-deps
            }
        , dhall-hpack-yaml =
            { main =
                "YamlMain.hs"
            , source-dirs =
                [ "exe/options", "exe/dhall-hpack-yaml" ]
            , dependencies =
                exe-deps
            }
        , dhall-hpack-dhall =
            { main =
                "DhallMain.hs"
            , source-dirs =
                [ "exe/options", "exe/dhall-hpack-dhall" ]
            , dependencies =
                exe-deps
            }
        }
    , tests =
        { golden =
            { main =
                "Golden.hs"
            , source-dirs =
                [ "library", "test/golden" ]
            , dependencies =
                [ "base"
                , "Cabal"
                , "Diff"
                , "dhall"
                , "filepath"
                , "microlens"
                , "prettyprinter"
                , "tasty"
                , "tasty-golden"
                , "text"
                , "megaparsec >= 7.0.1"
                , "dhall >= 1.18.0"
                , "dhall-json >= 1.2.4"
                , "hpack >= 0.31.0"
                , "transformers"
                , "aeson"
                , "utf8-string"
                ]
            }
        }
    }
