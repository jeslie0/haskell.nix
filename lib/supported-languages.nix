{pkgs, evalPackages, ghc}:
evalPackages.writeTextFile {
  name = "supported-languages";
  text = ''
    Haskell98
    Haskell2010
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.2" >=0) ''
        GHC2021
    '' + pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.10" >=0) ''
        GHC2024
    ''}Unsafe
    Trustworthy
    Safe
    AllowAmbiguousTypes
    NoAllowAmbiguousTypes
    AlternativeLayoutRule
    NoAlternativeLayoutRule
    AlternativeLayoutRuleTransitional
    NoAlternativeLayoutRuleTransitional
    Arrows
    NoArrows
    AutoDeriveTypeable
    NoAutoDeriveTypeable
    BangPatterns
    NoBangPatterns
    BinaryLiterals
    NoBinaryLiterals
    CApiFFI
    NoCApiFFI
    CPP
    NoCPP
    CUSKs
    NoCUSKs
    ConstrainedClassMethods
    NoConstrainedClassMethods
    ConstraintKinds
    NoConstraintKinds
    DataKinds
    NoDataKinds
    DatatypeContexts
    NoDatatypeContexts
    DefaultSignatures
    NoDefaultSignatures
    DeriveAnyClass
    NoDeriveAnyClass
    DeriveDataTypeable
    NoDeriveDataTypeable
    DeriveFoldable
    NoDeriveFoldable
    DeriveFunctor
    NoDeriveFunctor
    DeriveGeneric
    NoDeriveGeneric
    DeriveLift
    NoDeriveLift
    DeriveTraversable
    NoDeriveTraversable
    DerivingStrategies
    NoDerivingStrategies
    DerivingVia
    NoDerivingVia
    DisambiguateRecordFields
    NoDisambiguateRecordFields
    DoAndIfThenElse
    NoDoAndIfThenElse
    BlockArguments
    NoBlockArguments
    DoRec
    NoDoRec
    DuplicateRecordFields
    NoDuplicateRecordFields
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.2" >=0) ''
        FieldSelectors
        NoFieldSelectors
    ''}EmptyCase
    NoEmptyCase
    EmptyDataDecls
    NoEmptyDataDecls
    EmptyDataDeriving
    NoEmptyDataDeriving
    ExistentialQuantification
    NoExistentialQuantification
    ExplicitForAll
    NoExplicitForAll
    ExplicitNamespaces
    NoExplicitNamespaces
    ExtendedDefaultRules
    NoExtendedDefaultRules
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.8" >=0) ''
        ExtendedLiterals
        NoExtendedLiterals
    ''}FlexibleContexts
    NoFlexibleContexts
    FlexibleInstances
    NoFlexibleInstances
    ForeignFunctionInterface
    NoForeignFunctionInterface
    FunctionalDependencies
    NoFunctionalDependencies
    GADTSyntax
    NoGADTSyntax
    GADTs
    NoGADTs
    GHCForeignImportPrim
    NoGHCForeignImportPrim
    GeneralizedNewtypeDeriving
    NoGeneralizedNewtypeDeriving
    GeneralisedNewtypeDeriving
    NoGeneralisedNewtypeDeriving
    ImplicitParams
    NoImplicitParams
    ImplicitPrelude
    NoImplicitPrelude
    ImportQualifiedPost
    NoImportQualifiedPost
    ImpredicativeTypes
    NoImpredicativeTypes
    IncoherentInstances
    NoIncoherentInstances
    TypeFamilyDependencies
    NoTypeFamilyDependencies
    InstanceSigs
    NoInstanceSigs
    ApplicativeDo
    NoApplicativeDo
    InterruptibleFFI
    NoInterruptibleFFI
    ${pkgs.lib.optionalString (pkgs.stdenv.targetPlatform.isGhcjs || builtins.compareVersions ghc.version "9.8" <0) ''
        JavaScriptFFI
    ''}NoJavaScriptFFI
    KindSignatures
    NoKindSignatures
    LambdaCase
    NoLambdaCase
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.0" >=0) ''
        LexicalNegation
        NoLexicalNegation
    ''}LiberalTypeSynonyms
    NoLiberalTypeSynonyms
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.2" >=0) ''
        LinearTypes
        NoLinearTypes
    '' + pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.10" >=0) ''
        ListTuplePuns
        NoListTuplePuns
    ''}MagicHash
    NoMagicHash
    MonadComprehensions
    NoMonadComprehensions
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.2" <0) ''
        MonadFailDesugaring
        NoMonadFailDesugaring
    ''}MonoLocalBinds
    NoMonoLocalBinds
    ${if (builtins.compareVersions ghc.version "9.2" >=0)
      then ''
        DeepSubsumption
        NoDeepSubsumption
      ''
      else ''
        MonoPatBinds
        NoMonoPatBinds
      ''
    }MonomorphismRestriction
    NoMonomorphismRestriction
    MultiParamTypeClasses
    NoMultiParamTypeClasses
    MultiWayIf
    NoMultiWayIf
    NumericUnderscores
    NoNumericUnderscores
    NPlusKPatterns
    NoNPlusKPatterns
    NamedFieldPuns
    NoNamedFieldPuns
    NamedWildCards
    NoNamedWildCards
    NegativeLiterals
    NoNegativeLiterals
    HexFloatLiterals
    NoHexFloatLiterals
    NondecreasingIndentation
    NoNondecreasingIndentation
    NullaryTypeClasses
    NoNullaryTypeClasses
    NumDecimals
    NoNumDecimals
    OverlappingInstances
    NoOverlappingInstances
    OverloadedLabels
    NoOverloadedLabels
    OverloadedLists
    NoOverloadedLists
    OverloadedStrings
    NoOverloadedStrings
    PackageImports
    NoPackageImports
    ParallelArrays
    NoParallelArrays
    ParallelListComp
    NoParallelListComp
    PartialTypeSignatures
    NoPartialTypeSignatures
    PatternGuards
    NoPatternGuards
    PatternSignatures
    NoPatternSignatures
    PatternSynonyms
    NoPatternSynonyms
    PolyKinds
    NoPolyKinds
    PolymorphicComponents
    NoPolymorphicComponents
    QuantifiedConstraints
    NoQuantifiedConstraints
    PostfixOperators
    NoPostfixOperators
    QuasiQuotes
    NoQuasiQuotes
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.2" >=0) ''
        QualifiedDo
        NoQualifiedDo
    ''}Rank2Types
    NoRank2Types
    RankNTypes
    NoRankNTypes
    RebindableSyntax
    NoRebindableSyntax
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.2" >=0) ''
        OverloadedRecordDot
        NoOverloadedRecordDot
        OverloadedRecordUpdate
        NoOverloadedRecordUpdate
    ''}RecordPuns
    NoRecordPuns
    RecordWildCards
    NoRecordWildCards
    RecursiveDo
    NoRecursiveDo
    RelaxedLayout
    NoRelaxedLayout
    RelaxedPolyRec
    NoRelaxedPolyRec
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.10" >=0) ''
        RequiredTypeArguments
        NoRequiredTypeArguments
    ''}RoleAnnotations
    NoRoleAnnotations
    ScopedTypeVariables
    NoScopedTypeVariables
    StandaloneDeriving
    NoStandaloneDeriving
    StarIsType
    NoStarIsType
    StaticPointers
    NoStaticPointers
    Strict
    NoStrict
    StrictData
    NoStrictData
    TemplateHaskell
    NoTemplateHaskell
    TemplateHaskellQuotes
    NoTemplateHaskellQuotes
    StandaloneKindSignatures
    NoStandaloneKindSignatures
    TraditionalRecordSyntax
    NoTraditionalRecordSyntax
    TransformListComp
    NoTransformListComp
    TupleSections
    NoTupleSections
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.8" >=0) ''
        TypeAbstractions
        NoTypeAbstractions
    ''}TypeApplications
    NoTypeApplications
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.6" >=0) ''
        TypeData
        NoTypeData
    ''}TypeInType
    NoTypeInType
    TypeFamilies
    NoTypeFamilies
    TypeOperators
    NoTypeOperators
    TypeSynonymInstances
    NoTypeSynonymInstances
    UnboxedTuples
    NoUnboxedTuples
    UnboxedSums
    NoUnboxedSums
    UndecidableInstances
    NoUndecidableInstances
    UndecidableSuperClasses
    NoUndecidableSuperClasses
    UnicodeSyntax
    NoUnicodeSyntax
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.2" >=0) ''
        UnliftedDatatypes
        NoUnliftedDatatypes
    ''}UnliftedFFITypes
    NoUnliftedFFITypes
    UnliftedNewtypes
    NoUnliftedNewtypes
    ViewPatterns
    NoViewPatterns
    ${pkgs.lib.optionalString (builtins.compareVersions ghc.version "9.11" >=0) ''
      OrPatterns
      NoOrPatterns
      MultilineStrings
      NoMultilineStrings
      NamedDefaults
      NoNamedDefaults
    ''}'';
}
