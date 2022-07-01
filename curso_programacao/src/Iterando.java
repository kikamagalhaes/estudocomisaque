import java.util.Arrays;
import java.util.List;

public class Iterando {

	public static void main(String[] args) {

		List<Integer> itens = Arrays.asList(11, 10, 16, 5, 85);
		List<String> frutas = Arrays.asList("mamão", "banana", "abacaxi");

		itens.forEach(item -> System.out.println(item));
		System.out.println("");
		frutas.forEach(nome -> System.out.println(nome));

	}
}
