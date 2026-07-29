import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.VariationalIntegrator

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure RungeKuttaStage where
  a : ℝ
  b : ℝ
  c : ℝ

structure PartitionedRungeKuttaMethod where
  stages : List RungeKuttaStage
  orderCondition : Prop
  symplecticCondition : Prop
  orderConditionTerm : orderCondition
  symplecticConditionTerm : symplecticCondition

structure SymplecticPartitionedRungeKuttaPackage {A : AdmissibleClass} (P : SymplecticIntegratorPackage A) where
  method : PartitionedRungeKuttaMethod
  coefficientCondition : Prop
  implicitEquation : Prop
  coefficientConditionTerm : coefficientCondition
  implicitEquationTerm : implicitEquation

def SymplecticPRKClosed {A : AdmissibleClass} (P : SymplecticIntegratorPackage A) (S : SymplecticPartitionedRungeKuttaPackage P) : Prop :=
  S.method.symplecticCondition ∧ S.coefficientCondition ∧ S.implicitEquation

theorem symplectic_prk_closed (A : AdmissibleClass) (P : SymplecticIntegratorPackage A) (S : SymplecticPartitionedRungeKuttaPackage P) : SymplecticPRKClosed P S := by
  exact And.intro S.method.symplecticConditionTerm (And.intro S.coefficientConditionTerm S.implicitEquationTerm)

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse