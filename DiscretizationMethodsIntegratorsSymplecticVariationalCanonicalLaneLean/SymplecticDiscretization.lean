import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariational

structure SymplecticDiscretization where
  phaseSpace : Type u
  symplecticForm : phaseSpace → phaseSpace → ℝ
  discreteFlow : (phaseSpace → phaseSpace) → Prop
  symplecticPreservation : Prop
  discreteLagrangian : (phaseSpace → phaseSpace → ℝ) → Prop

structure SymplecticDiscretizationEvidence (S : SymplecticDiscretization) where
  symplecticPreservationClosed : S.symplecticPreservation
  discreteLagrangianClosed : S.discreteLagrangian (λ p q => 0)

def SymplecticDiscretizationClosed (S : SymplecticDiscretization) : Prop :=
  S.symplecticPreservation

theorem symplectic_discretization_closed_from_evidence (S : SymplecticDiscretization)
    (E : SymplecticDiscretizationEvidence S) : SymplecticDiscretizationClosed S :=
  E.symplecticPreservationClosed

end DiscretizationMethodsIntegratorsSymplecticVariational
end HautevilleHouse