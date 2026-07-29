import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariational

structure VariationalErrorMessage where
  integratorType : String
  errorOrder : ℕ
  localTruncationError : ℝ
  globalError : ℝ
  convergenceRate : Prop
  convergenceRateTerm : convergenceRate

structure VariationalErrorEvidence (E : VariationalErrorMessage) where
  convergenceRateClosed : E.convergenceRate

def VariationalErrorClosed (E : VariationalErrorMessage) : Prop :=
  E.convergenceRate

theorem variational_error_closed_from_evidence (E : VariationalErrorMessage)
    (Ev : VariationalErrorEvidence E) : VariationalErrorClosed E :=
  Ev.convergenceRateClosed

end DiscretizationMethodsIntegratorsSymplecticVariational
end HautevilleHouse