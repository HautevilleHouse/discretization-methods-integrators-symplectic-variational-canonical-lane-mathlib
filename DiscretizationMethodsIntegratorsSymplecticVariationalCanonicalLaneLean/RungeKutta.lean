import canonicalLaneMathlib.AdmissibleClass

/-!
# Runge-Kutta Methods Package
-/

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure RungeKuttaPackage where
  stageCount : ℕ
  butcherTableau : List (List ℝ) × List ℝ
  explicit : Bool
  symplecticCondition : Prop
  orderConditions : Prop
  stabilityRegion : Prop
  symplecticConditionClosed : symplecticCondition
  orderConditionsClosed : orderConditions
  stabilityRegionClosed : stabilityRegion

structure RungeKuttaEvidence (R : RungeKuttaPackage) where
  symplecticConditionClosed : R.symplecticCondition
  orderConditionsClosed : R.orderConditions
  stabilityRegionClosed : R.stabilityRegion

def RungeKuttaClosed (R : RungeKuttaPackage) : Prop :=
  R.symplecticCondition ∧ R.orderConditions ∧ R.stabilityRegion

theorem runge_kutta_closed_from_evidence (R : RungeKuttaPackage) (E : RungeKuttaEvidence R) :
    RungeKuttaClosed R := by
  exact And.intro E.symplecticConditionClosed (And.intro E.orderConditionsClosed E.stabilityRegionClosed)

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse