import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

def bridgeClosed (A : AdmittedObject) : Prop :=
  SymplecticWitnessClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A.object := by
  exact A.object.conclusion

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
