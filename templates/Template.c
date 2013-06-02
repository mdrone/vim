:insert
/*
* File Name     :
* Purpose       :
* Creation Date :
* Last Modified :
* Created By    :
*
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>


#define DEMOVERSION



/*
		Programmbeschreibung




*/
/*
//Syntax zur dynamischen Speicherverwaltung:
//
//malloc:
//ARRAY(bzwPOINTER) = ( DATENTYP * ) malloc ( GROESSE * sizeof ( DATENTYP ) ) ;
//calloc:
//ARRAY(bzwPOINTER) = ( DATENTYP * ) calloc ( GROESSE , sizeof ( DATENTYP ) ) ;
//realloc:
//realloc = ( ARRAY , INKREMENT ) ;

//Farbcodes:
//
// "\033[0;31m 	Dieser Text ist ein roter Text		.."
// "\033[0m    	Standardeinstellung					.."


//Dateiverwaltung:
//
//unsigned int textlaenge = 0L ;						//

//FILE *eingabedatei ;									//Pointer anlegen
//FILE *ausgabedatei ;									//Pointer anlegen
//
//Datei lesend oeffnen 
//eingabedatei = fopen ( "eingabeDatei.txt" , "rb" ) ;

//if ( eingabedatei != NULL )							//NULL wird bei nicht existenter/
//{														//erreichbarer Datei ausgegeben
//fseek( eingabedatei , 0L , SEEK_END ) ;				//Textlaenge bestimmen
//textlaenge = ftell ( eingabedatei ) ;					//Textlaenge speichern
//rewind( eingabedatei ) ;								//Zurueckspulen
//ARRAY = ( char * ) calloc ( textlaenge , sizeof ( char ) ) ;	//ALLOZIIEREN
//fscanf ( eingabedatei , "%s" , textArray ) ;			//8Chars in textArray (String) speichern
//fclose ( eingabedatei ) ;								//Datei schliessen
//}
////ENDE 

//String in ausgabeDatei.txt schreiben
//ausgabedatei = fopen ( "ausgabeDatei.txt" , "w+" ) ;	//Datei wird notfalls angelegt

//if ( ausgabedatei != NULL )							//s.o.
//{
//fprintf ( ausgabedatei , "%s" , textArray ) ;			//String in Datei speichern
//fclose ( ausgabedatei ) ;								//Datei schliessen
//}
////speichern ENDE
*/

//Debugger Breakpoint
void Debug ( void )
{
	printf ( "\a" ) ;
}
//ENDE Breakpoint


int main ( int argc , char *argv[] )
{

if ( argc > 1 )
{
		if ( ( strcmp ( argv[1] , "--help" ) == 0 ) || ( strcmp ( argv[1] , "-h" ) == 0 ) )
		{
				printf ( "\n\t-h\t--help shows this Text\n" );
				printf ( "\n\t-u\t--usage shows how to use this Program\n" ) ;
		}
		if ( ( strcmp ( argv[1] , "--usage" ) == 0 ) || ( strcmp ( argv[1] , "-u" ) == 0 ) )
		{
				printf ( "\n\t-u\t--usage" );
		}
}






#ifdef DEMOVERSION




#endif








return 0;
}
