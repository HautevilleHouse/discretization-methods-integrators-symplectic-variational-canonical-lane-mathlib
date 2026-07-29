import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

def ConstrainedSymplecticClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A.object ∧ gateClosed A

theorem constrained_symplectic_endgame (A : AdmissibleClass) :
    ConstrainedSymplecticClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
