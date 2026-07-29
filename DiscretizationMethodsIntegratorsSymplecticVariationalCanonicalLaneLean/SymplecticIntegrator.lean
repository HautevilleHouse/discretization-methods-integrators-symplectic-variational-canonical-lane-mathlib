import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.BridgeLemmas

/-!
# Symplectic Integrator Package
-/

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure SymplecticIntegratorPackage where
  phaseSpace : Type u
  symplecticForm : Type v
  integratorMap : phaseSpace → phaseSpace
  symplecticCondition : Prop
  orderOfAccuracy : Nat
  energyConservation : Prop

structure SymplecticIntegratorEvidence (I : SymplecticIntegratorPackage) where
  symplecticConditionClosed : I.symplecticCondition
  orderOfAccuracyClosed : I.orderOfAccuracy ≥ 1
  energyConservationClosed : I.energyConservation

def SymplecticIntegratorClosed (I : SymplecticIntegratorPackage) : Prop :=
  I.symplecticCondition ∧ I.orderOfAccuracy ≥ 1 ∧ I.energyConservation

theorem symplectic_integrator_closed_from_evidence (I : SymplecticIntegratorPackage)
    (E : SymplecticIntegratorEvidence I) : SymplecticIntegratorClosed I := by
  exact And.intro E.symplecticConditionClosed
    (And.intro E.orderOfAccuracyClosed E.energyConservationClosed)

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
