function Output=adaptivemedian(GrayScaleImage);

        NoisyImage=GrayScaleImage;
        NoisyImage=double(GrayScaleImage);
        [R C P]=size(NoisyImage);
        OutImage=zeros(R,C);
        Amin=[];
        Amax=[];
        Amed=[];
        

        for i=1:R
        
            for j=1:C
                       if (i==1 & j==1)


                  
                        elseif (i==1 & j==C)



                        elseif (i==R & j==1)




                        elseif (i==R & j==C)




                        elseif (i==1)




                        elseif (i==R)


                        elseif (j==C)




                        elseif (j==1)





                       else



                                     ST1 = NoisyImage((i-1),(j-1));
                                     ST2 = NoisyImage((i-1),(j));
                                     ST3 = NoisyImage((i-1),(j+1));
                                     ST4 = NoisyImage((i),(j-1));
                                     ST5 = NoisyImage(i,j);
                                     ST6 = NoisyImage((i),(j+1));
                                     ST7 = NoisyImage((i+1),(j-1));
                                     ST8 = NoisyImage((i+1),(j));
                                     ST9 = NoisyImage((i+1),(j+1));
                                     TempPixel=[ST1,ST2,ST3,ST4,ST5,ST6,ST7,ST8,ST9];
                                     Zxy=NoisyImage(i,j);
                                     Amin=min(TempPixel);
                                     Amax=max(TempPixel);
                                     Zmed=median(TempPixel);
                                     A1 = Amed - Amin;
                                     A2 = Amed - Amax;

                                     if A1 > 0 && A2 < 0

                                          %   go to level B
                                          B1 = Zxy - Amin;
                                          B2 = Zxy - Amax;
                                          if B1 > 0 && B2 < 0
                                              PreProcessedImage(i,j)= Zxy;
                                          else
                                              PreProcessedImage(i,j)= Amed;

                                          end
                                     else

                                         if ((R > 4 && R < R-5) && (C > 4 && C < C-5))

                                         S1 = NoisyImage((i-1),(j-1));
                                         S2 = NoisyImage((i-2),(j-2));
                                         S3 = NoisyImage((i-1),(j));
                                         S4 = NoisyImage((i-2),(j));
                                         S5 = NoisyImage((i-1),(j+1));
                                         S6 = NoisyImage((i-2),(j+2));
                                         S7 = NoisyImage((i),(j-1));
                                         S8 = NoisyImage((i),(j-2));

                                         S9 = NoisyImage(i,j);
                                         S10 = NoisyImage((i),(j+1));
                                         S11 = NoisyImage((i),(j+2));
                                         S12 = NoisyImage((i+1),(j-1));
                                         S13 = NoisyImage((i+2),(j-2));
                                         S14 = NoisyImage((i+1),(j));
                                         S15 = NoisyImage((i+2),(j));
                                         S16 = NoisyImage((i+1)),((j+1));
                                         S17 = NoisyImage((i+2)),((j+2));
                                         TempPixel2=[S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17];
                                         Amed2=median(TempPixel2);
                                         PreProcessedImage(i,j)= Amed2;
                                         else

                                         PreProcessedImage(i,j)= Amed;

                                         end

                                     end         

                  end    

            end
        end
        
        
        
        
Output=PreProcessedImage;