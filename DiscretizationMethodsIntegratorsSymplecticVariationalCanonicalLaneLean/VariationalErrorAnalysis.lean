import canonicalLaneMathlib.AdmissibleClass
import DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.SymplecticIntegratorTypes

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure VariationalErrorPackage {P : SymplecticIntegratorPackage} (F : SymplecticIntegratorEvidence P) where
  localTruncationError : Prop
  globalErrorBound : Prop
  convergenceOrder : Nat
  localTruncationErrorClosed : localTruncationError
  globalErrorBoundClosed : globalErrorBound

structure VariationalErrorEvidence {P : SymplecticIntegratorPackage} {F : SymplecticIntegratorEvidence P}
    (V : VariationalErrorPackage F) where
  localTruncationErrorClosed : V.localTruncationError
  globalErrorBoundClosed : V.globalErrorBound

def VariationalErrorClosed {P : SymplecticIntegratorPackage} {F : SymplecticIntegratorEvidence P}
    (V : VariationalErrorPackage F) : Prop :=
  V.localTruncationError ∧ V.globalErrorBound

theorem variational_error_closed_from_evidence {P : SymplecticIntegratorPackage} {F : SymplecticIntegratorEvidence P}
    (V : VariationalErrorPackage F) (E : VariationalErrorEvidence V) :
    VariationalErrorClosed V := by
  exact And.intro E.localTruncationErrorClosed E.globalErrorBoundClosed

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
