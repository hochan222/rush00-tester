/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   rush03.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: holee <holee@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/10/20 18:59:54 by holee             #+#    #+#             */
/*   Updated: 2020/10/20 19:27:46 by holee            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "rush.h"

void	rush(int x, int y);
int		hash(int x, int n);

void	rush(int x, int y)
{
	static char const *const	boundaries = "ABCB BABC";
	int							i;
	int							j;

	j = 0;
	while (j < y)
	{
		i = 0;
		while (i < x)
		{
			ft_putchar(boundaries[3 * hash(j, y) + hash(i, x)]);
			++i;
		}
		ft_putchar('\n');
		++j;
	}
}

int		hash(int x, int n)
{
	return (x ? 1 + (x + 1) / n : x);
}
