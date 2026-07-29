import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.VariationalDiscretization

/-!
# Backward Error Analysis Package
-/

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure BackwardErrorAnalysisPackage where
  modifiedHamiltonian : Type u
  truncationError : Type v
  shadowingProperty : Prop
  exponentialSmallness : Prop

structure BackwardErrorAnalysisEvidence (B : BackwardErrorAnalysisPackage) where
  shadowingPropertyClosed : B.shadowingProperty
  exponentialSmallnessClosed : B.exponentialSmallness

def BackwardErrorAnalysisClosed (B : BackwardErrorAnalysisPackage) : Prop :=
  B.shadowingProperty ∧ B.exponentialSmallness

theorem backward_error_analysis_closed_from_evidence (B : BackwardErrorAnalysisPackage)
    (E : BackwardErrorAnalysisEvidence B) : BackwardErrorAnalysisClosed B := by
  exact And.intro E.shadowingPropertyClosed E.exponentialSmallnessClosed

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
