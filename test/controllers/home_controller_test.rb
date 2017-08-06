require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get buscar" do
    get home_buscar_url
    assert_response :success
  end

  test "should get elegir" do
    get home_elegir_url
    assert_response :success
  end

  test "should get resultados" do
    get home_resultados_url
    assert_response :success
  end

end
