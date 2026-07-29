import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariational

structure StagedSymplecticRungeKutta where
  numStages : ℕ
  butcherTableau : Array (Array ℝ × Array ℝ)
  symplecticCondition : Prop
  partitionedForm : Prop
  orderConditions : Prop
  symplecticConditionTerm : symplecticCondition
  orderConditionsTerm : orderConditions

structure StagedSymplecticRungeKuttaEvidence (R : StagedSymplecticRungeKutta) where
  symplecticConditionClosed : R.symplecticCondition
  orderConditionsClosed : R.orderConditions

def StagedSymplecticRungeKuttaClosed (R : StagedSymplecticRungeKutta) : Prop :=
  R.symplecticCondition ∧ R.orderConditions

theorem staged_symplectic_runge_kutta_closed_from_evidence
    (R : StagedSymplecticRungeKutta) (E : StagedSymplecticRungeKuttaEvidence R) :
    StagedSymplecticRungeKuttaClosed R :=
  And.intro E.symplecticConditionClosed E.orderConditionsClosed

end DiscretizationMethodsIntegratorsSymplecticVariational
end HautevilleHouse