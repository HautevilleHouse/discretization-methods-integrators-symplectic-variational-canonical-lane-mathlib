import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariational

structure VariationalIntegratorScheme where
  configSpace : Type u
  lagrangian : configSpace → configSpace → ℝ
  discreteAction : (ℕ → configSpace) → ℝ
  variationEquation : (ℕ → configSpace) → ((ℕ → configSpace) → ℝ) → Prop
  symplecticStructure : Prop
  symplecticStructureTerm : symplecticStructure

structure VariationalIntegratorEvidence (V : VariationalIntegratorScheme) where
  variationEquationClosed : ∀ q : ℕ → V.configSpace, V.variationEquation q (λ _ => 0)
  symplecticStructureClosed : V.symplecticStructure

def VariationalIntegratorClosed (V : VariationalIntegratorScheme) : Prop :=
  V.symplecticStructure

theorem variational_integrator_closed_from_evidence (V : VariationalIntegratorScheme)
    (E : VariationalIntegratorEvidence V) : VariationalIntegratorClosed V :=
  E.symplecticStructureClosed

end DiscretizationMethodsIntegratorsSymplecticVariational
end HautevilleHouse