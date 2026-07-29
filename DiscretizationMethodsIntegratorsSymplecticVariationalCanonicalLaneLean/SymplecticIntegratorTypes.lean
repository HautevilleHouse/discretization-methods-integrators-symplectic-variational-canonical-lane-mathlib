import canonicalLaneMathlib.AdmissibleClass
import DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.IntegratorAdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure SymplecticIntegratorPackage where
  phaseSpace : Type u
  symplecticForm : Type v
  timeStep : ℝ
  integratorMap : phaseSpace → phaseSpace
  symplecticityCondition : Prop

structure SymplecticIntegratorEvidence (P : SymplecticIntegratorPackage) where
  symplecticityConditionClosed : P.symplecticityCondition

def SymplecticIntegratorClosed (P : SymplecticIntegratorPackage) : Prop :=
  P.symplecticityCondition

theorem symplectic_integrator_closed_from_evidence (P : SymplecticIntegratorPackage)
    (E : SymplecticIntegratorEvidence P) : SymplecticIntegratorClosed P := by
  exact E.symplecticityConditionClosed

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
