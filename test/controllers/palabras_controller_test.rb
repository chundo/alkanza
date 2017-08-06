require 'test_helper'

class PalabrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @palabra = palabras(:one)
  end

  test "should get index" do
    get palabras_url
    assert_response :success
  end

  test "should get new" do
    get new_palabra_url
    assert_response :success
  end

  test "should create palabra" do
    assert_difference('Palabra.count') do
      post palabras_url, params: { palabra: { nombre: @palabra.nombre } }
    end

    assert_redirected_to palabra_url(Palabra.last)
  end

  test "should show palabra" do
    get palabra_url(@palabra)
    assert_response :success
  end

  test "should get edit" do
    get edit_palabra_url(@palabra)
    assert_response :success
  end

  test "should update palabra" do
    patch palabra_url(@palabra), params: { palabra: { nombre: @palabra.nombre } }
    assert_redirected_to palabra_url(@palabra)
  end

  test "should destroy palabra" do
    assert_difference('Palabra.count', -1) do
      delete palabra_url(@palabra)
    end

    assert_redirected_to palabras_url
  end
end
