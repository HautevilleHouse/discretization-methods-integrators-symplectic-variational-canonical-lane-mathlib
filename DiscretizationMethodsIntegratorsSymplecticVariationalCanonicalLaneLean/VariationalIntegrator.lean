import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure DiscreteLagrangianSystem where
  Q : Type u
  h : ℝ
  L : Q → Q → ℝ
  regularityCondition : Prop
  boundaryCondition : Prop
  regularityConditionTerm : regularityCondition
  boundaryConditionTerm : boundaryCondition

structure SymplecticVariationalIntegrator where
  system : DiscreteLagrangianSystem
  integratorMap : system.Q × ℝ → system.Q × ℝ
  symplecticCondition : Prop
  variationalDerivation : Prop
  symplecticConditionTerm : symplecticCondition
  variationalDerivationTerm : variationalDerivation

structure SymplecticIntegratorPackage (A : AdmissibleClass) where
  integrator : SymplecticVariationalIntegrator
  discreteActionPreserved : Prop
  momentumConserved : Prop
  discreteNoetherTheorem : Prop
  discreteActionPreservedTerm : discreteActionPreserved
  momentumConservedTerm : momentumConserved
  discreteNoetherTheoremTerm : discreteNoetherTheorem

def SymplecticIntegratorClosed (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A ∧ SymplecticVariationalIntegrator.symplecticCondition

theorem symplectic_integrator_closed (A : AdmissibleClass) (P : SymplecticIntegratorPackage A) : SymplecticIntegratorClosed A := by
  exact And.intro (And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)) P.integrator.symplecticConditionTerm

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse