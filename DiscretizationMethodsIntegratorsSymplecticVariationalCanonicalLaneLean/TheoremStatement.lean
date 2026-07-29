import DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure SymplecticVariationalTheoremStatement where
  discreteLagrangianPreserved : Prop
  symplecticIntegratorExists : Prop
  variationalErrorBound : Prop
  discreteNoetherTheorem : Prop

def TheoremStatementClosed (S : SymplecticVariationalTheoremStatement) : Prop :=
  S.discreteLagrangianPreserved ∧ S.symplecticIntegratorExists ∧
  S.variationalErrorBound ∧ S.discreteNoetherTheorem

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse