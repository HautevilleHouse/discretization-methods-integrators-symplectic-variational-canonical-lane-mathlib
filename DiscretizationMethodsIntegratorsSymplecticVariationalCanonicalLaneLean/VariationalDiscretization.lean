import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.SymplecticIntegrator

/-!
# Variational Discretization Package
-/

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure VariationalDiscretizationPackage where
  lagrangian : Type u
  discreteLagrangian : Type v
  actionFunctional : Type w
  discreteEulerLagrange : Prop
  variationalSymplecticity : Prop

structure VariationalDiscretizationEvidence (V : VariationalDiscretizationPackage) where
  discreteEulerLagrangeClosed : V.discreteEulerLagrange
  variationalSymplecticityClosed : V.variationalSymplecticity

def VariationalDiscretizationClosed (V : VariationalDiscretizationPackage) : Prop :=
  V.discreteEulerLagrange ∧ V.variationalSymplecticity

theorem variational_discretization_closed_from_evidence (V : VariationalDiscretizationPackage)
    (E : VariationalDiscretizationEvidence V) : VariationalDiscretizationClosed V := by
  exact And.intro E.discreteEulerLagrangeClosed E.variationalSymplecticityClosed

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
