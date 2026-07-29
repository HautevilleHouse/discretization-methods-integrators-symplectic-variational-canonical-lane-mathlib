import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariational

structure DiscreteEulerLagrange where
  configPath : Type u
  discreteLagrangian : (configPath → configPath → ℝ) → Prop
  eulerLagrangeEquation : (ℕ → configPath) → Prop
  variationalSymmetry : Prop
  eulerLagrangeEquationTerm : ∀ q : ℕ → configPath, eulerLagrangeEquation q
  variationalSymmetryTerm : variationalSymmetry

structure DiscreteEulerLagrangeEvidence (D : DiscreteEulerLagrange) where
  eulerLagrangeEquationClosed : ∀ q : ℕ → D.configPath, D.eulerLagrangeEquation q
  variationalSymmetryClosed : D.variationalSymmetry

def DiscreteEulerLagrangeClosed (D : DiscreteEulerLagrange) : Prop :=
  D.variationalSymmetry

theorem discrete_euler_lagrange_closed_from_evidence (D : DiscreteEulerLagrange)
    (E : DiscreteEulerLagrangeEvidence D) : DiscreteEulerLagrangeClosed D :=
  E.variationalSymmetryClosed

end DiscretizationMethodsIntegratorsSymplecticVariational
end HautevilleHouse