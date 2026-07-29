import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure DiscretizationSchemePackage where
  meshFamily : Type u
  discreteEquations : Type v
  convergenceRate : Prop
  geometricPropertiesPreserved : Prop
  energyBehavior : Prop

def DiscretizationSchemeClosed (D : DiscretizationSchemePackage) : Prop :=
  D.convergenceRate ∧ D.geometricPropertiesPreserved ∧ D.energyBehavior

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse