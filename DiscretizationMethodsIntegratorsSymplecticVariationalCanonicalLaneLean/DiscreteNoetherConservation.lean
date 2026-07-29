import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariational

structure DiscreteNoetherConservation where
  symmetryGroup : Type u
  discreteAction : (ℕ → Type u) → ℝ
  symmetryAction : ℕ → (ℕ → Type u) → ℕ → Type u
  conservedMomentum : (ℕ → Type u) → ℝ
  conservationLaw : Prop
  conservationLawTerm : conservationLaw

structure DiscreteNoetherEvidence (N : DiscreteNoetherConservation) where
  conservationLawClosed : N.conservationLaw

def DiscreteNoetherClosed (N : DiscreteNoetherConservation) : Prop :=
  N.conservationLaw

theorem discrete_noether_closed_from_evidence (N : DiscreteNoetherConservation)
    (E : DiscreteNoetherEvidence N) : DiscreteNoetherClosed N :=
  E.conservationLawClosed

end DiscretizationMethodsIntegratorsSymplecticVariational
end HautevilleHouse